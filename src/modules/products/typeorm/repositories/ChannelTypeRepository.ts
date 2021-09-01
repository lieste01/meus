import { EntityRepository, Repository } from 'typeorm';
import ChannelType from '../entities/ChannelType';

@EntityRepository(ChannelType)
export class ChannelTypeRepository extends Repository<ChannelType> {
  public async findByUuid(uuid: string): Promise<ChannelType | undefined> {
    const channelType = this.findOne({
      where: {
        uuid,
      },
    });
    return channelType;
  }
}
